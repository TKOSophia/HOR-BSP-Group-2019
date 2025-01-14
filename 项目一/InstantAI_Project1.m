% InstantAI.m
%
% Example Category:
%    AI
% Matlab(2010 or 2010 above)
%
% Description:
%    This example demonstrates how to use Instant AI function.
%
% Instructions for Running:
%    1. Set the 'deviceDescription' for opening the device. 
%    2. Set the 'startChannel' as the first channel for scan analog samples  
%    3. Set the 'channelCount' to decide how many sequential channels to 
%       scan analog samples.
%
% I/O Connections Overview:
%    Please refer to your hardware reference manual.
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Editter : Yuncong Ran 2019/10/21
%   Modified InstantAI& TimeCallBack function, added input hObjct & handles
%   to convey parameters. Struct Handles consists of following vars:
% 
%     LineHandle: Convey animation line handle to TimeCallBack,to draw the real-time signal.
%     dataAI: Data storage in the Main function. 
%     dataNum: Inidicate sample number, which is given by the timecallback
%              function
%     Samplingrate: Sampling Rate, known as the input para 'period' of
%                   Timer object.
% 
%   The funtion will display input signal in real-time in the axes area which are determined by LineHandle, 
%   and return dataAI& dataNum to handles struct once finished.
%   
%   Modified TimerCallBack Fcn termination mode, activition of "STOP"
%   button in GUI is needed. 
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
function handlesret = InstantAI_Project1(hObject,handles)
% 使用全局变量在InstantAI 和 TimerCallBack Fcn之间传递数据，因为未找到设置TimerCallBack
% Fcn的返回值的方法；在TimerCallBack Fcn中调用的guidata不会将数据储存到Figure1的空间中，
% 而是另开一个空间，即使传入了参数hObject。
global handlesconvey 
global t
handlesconvey = handles;

% Make Automation.BDaq assembly visible to MATLAB.
BDaq = NET.addAssembly('Automation.BDaq');

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other 
% devices according to their needs. 
deviceDescription = 'USB-4704,BID#0'; 
startChannel = int32(0);
channelCount = int32(4); %default channel number is 4.

sr = handles.Fs;
period = 1/sr;
% Initial data number is 1.Run Initialization each time "BEGIN" is pressed.

% Pre-assigned memeroy, Attention this might be insufficient.
% Simultaneously change the value in "BEGIN" callback function and stop condition when change happens here.

% get stop command via global varible.


% Step 1: Create a 'InstantAiCtrl' for Instant AI function.
instantAiCtrl = Automation.BDaq.InstantAiCtrl();

try
    % Step 2: Select a device by device number or device description and 
    % specify the access mode. In this example we use 
    % AccessWriteWithReset(default) mode so that we can fully control the 
    % device, including configuring, sampling, etc.
    instantAiCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    data = NET.createArray('System.Double', channelCount);
    
    % Step 3: Read samples and do post-process, we show data here.
    errorCode = Automation.BDaq.ErrorCode();
%     t = timer( 'period', 1, 'executionmode', 'fixedrate', ...
%         'StartDelay', 1);
%     t.TimerFcn = @TimerCallback;
%     [dataAI,dataNum] = TimerFcn(t,instantAiCtrl, startChannel, ...
%         channelCount, data, dataAI, dataNum, linehandle);
 
      t  = timer('TimerFcn', {@TimerCallback, instantAiCtrl, startChannel, ...
         channelCount, data,hObject}, 'period', period, 'executionmode', 'fixedrate', ...
         'StartDelay', 1);


% 
    % edittor: Ran, 2019/10/14
    % Changed Time class Instantiation format.
    % Added new varibles here: dataAI, dataNum,linehandles.  
    i = 1;
    start(t);

     uiwait(handles.figure1);
%     stop(t);
    guidata(hObject,handles);
    
   
   
    
catch e
    % Something is wrong.
    if BioFailed(errorCode)    
        errStr = 'Some error occurred. And the last error code is ' ... 
            + errorCode.ToString();
    else
        errStr = e.message;
    end
    disp(errStr); 
end



% Step 4: Close device and release any allocated resource.
instantAiCtrl.Dispose();
handlesret = handlesconvey;

clear global handlesconvey
end

function result = BioFailed(errorCode)

result =  errorCode < Automation.BDaq.ErrorCode.Success && ...
    errorCode >= Automation.BDaq.ErrorCode.ErrorHandleNotValid;

end

function TimerCallback(obj, event, instantAiCtrl, startChannel, ...
    channelCount, data, hObject)
% 由于使用了全局变量，hObject不再有必要。
global handlesconvey
handles = handlesconvey;

% handles = guidata(hObject);

dataAI = handles.dataAI; 
dataNum = handles.dataNum;
LineHandles = handles.LineHandles;
AxesHandles = handles.AxesHandles;

errorCode = instantAiCtrl.Read(startChannel, channelCount, data); 
if BioFailed(errorCode)
    throw Exception();
end
fprintf('\n');

% get data
for j=0:(channelCount - 1)
    temp = data.Get(j);
    fprintf('channel %d : %10f ', j, temp);
    
    dataAI(dataNum,j+1) = temp;
    
    Realtimeplot_Project1(dataNum,temp,LineHandles(1,j+1));
    if dataNum > 100
        set(AxesHandles(j+1),'XLim',[dataNum-100,dataNum+10]);
    else 
        set(AxesHandles(j+1),'XLim',[0,dataNum+10]);
    end
end

dataNum = dataNum + 1;

handles.dataAI = dataAI;
handles.dataNum = dataNum;

handlesconvey = handles;
% guidata(hObject,handles);  % useless

end