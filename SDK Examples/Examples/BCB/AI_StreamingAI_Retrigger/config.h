//---------------------------------------------------------------------------

#ifndef configH
#define configH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <SysUtils.hpp>

#include "../../../Inc/bdaqctrl.h"

using namespace Automation::BDaq;
//---------------------------------------------------------------------------
struct ConfigureParameter
{
	wchar_t *deviceName;
        int channelStart;
        int channelCount;
	ValueRange valueRange;
        double clockRate;
        int32 sectionLength;
        int cycles;
        wchar_t *profileName;

        // for trigger
        TriggerAction triggerAction;
        SignalDrop triggerSource;
        ActiveSignal triggerEdge;
	int delayCount;
	double triggerLevel;

        //for trigger1
        TriggerAction trigger1Action;
        SignalDrop trigger1Source;
        ActiveSignal trigger1Edge;
	int delay1Count;
	double trigger1Level;
};

class TConfigForm : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TComboBox *cmbDevice;
        TButton *btnOk;
        TButton *btnCancel;
        TGroupBox *GroupBox1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TComboBox *cmbChannelStart;
        TComboBox *cmbChannelCount;
        TComboBox *cmbValueRange;
        TLabel *Label7;
        TEdit *txtClockRate;
        TLabel *Label8;
        TGroupBox *GroupBox2;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TComboBox *cmbTriggerSource;
        TComboBox *cmbTriggerEdge;
        TEdit *txtTriggerLevel;
        TEdit *txtDelayCount;
        TLabel *Label12;
        TEdit *txtSectionLength;
        TEdit *txtCycles;
        TLabel *Label14;
        TGroupBox *GroupBox3;
        TLabel *Label15;
        TLabel *Label16;
        TLabel *Label17;
        TLabel *Label18;
        TLabel *Label19;
        TComboBox *cmbTrigger1Source;
        TComboBox *cmbTrigger1Edge;
        TEdit *txtTrigger1Level;
        TEdit *txtTrigger1DelayCount;
        TLabel *Label20;
        TButton *btnBrowse;
        TEdit *txtProfileName;
        void __fastcall btnCancelClick(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall btnOkClick(TObject *Sender);
        void __fastcall cmbDeviceChange(TObject *Sender);
        void __fastcall cmbTriggerSourceChange(TObject *Sender);
        void __fastcall btnBrowseClick(TObject *Sender);
private:	// User declarations
        ConfigureParameter configure;

        bool isTriggerSupported;
        bool isTrigger1Supported;
public:		// User declarations
        __fastcall TConfigForm(TComponent* Owner);
        bool isFirstLoad;
        bool isBtnOkClicked;
        void Initialization();
        void CheckError(ErrorCode errorCode);
        ConfigureParameter GetConfigureParameter(){return configure;}
        void RefreshConfigureParameter();
};
//---------------------------------------------------------------------------
extern PACKAGE TConfigForm *ConfigForm;
//---------------------------------------------------------------------------
#endif