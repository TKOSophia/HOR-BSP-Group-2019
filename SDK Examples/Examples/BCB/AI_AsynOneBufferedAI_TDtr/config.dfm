object ConfigForm: TConfigForm
  Left = 301
  Top = 189
  BorderStyle = bsDialog
  Caption = 
    'Asynchronous One Buffered AI with Trigger Delay to Start - Confi' +
    'guration'
  ClientHeight = 271
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 24
    Width = 61
    Height = 17
    AutoSize = False
    Caption = 'Device:'
  end
  object Label13: TLabel
    Left = 320
    Top = 22
    Width = 41
    Height = 13
    Caption = 'Profile:'
  end
  object cmbDevice: TComboBox
    Left = 75
    Top = 20
    Width = 206
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ItemHeight = 13
    TabOrder = 0
    OnChange = cmbDeviceChange
  end
  object btnOk: TButton
    Left = 382
    Top = 231
    Width = 81
    Height = 26
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 524
    Top = 232
    Width = 81
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 18
    Top = 54
    Width = 303
    Height = 203
    Caption = 'Buffered AI settings'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 23
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Channel start:'
    end
    object Label3: TLabel
      Left = 8
      Top = 59
      Width = 73
      Height = 17
      AutoSize = False
      Caption = 'Channel count:'
    end
    object Label4: TLabel
      Left = 9
      Top = 91
      Width = 65
      Height = 17
      AutoSize = False
      Caption = 'Value range:'
    end
    object Label7: TLabel
      Left = 8
      Top = 166
      Width = 73
      Height = 17
      AutoSize = False
      Caption = 'Clock rate:'
    end
    object Label8: TLabel
      Left = 247
      Top = 168
      Width = 13
      Height = 13
      Caption = 'Hz'
    end
    object Label5: TLabel
      Left = 9
      Top = 124
      Width = 80
      Height = 17
      AutoSize = False
      Caption = 'Section Length:'
    end
    object cmbChannelStart: TComboBox
      Left = 88
      Top = 22
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      TabOrder = 0
    end
    object cmbChannelCount: TComboBox
      Left = 88
      Top = 55
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      TabOrder = 1
    end
    object cmbValueRange: TComboBox
      Left = 88
      Top = 88
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      TabOrder = 2
    end
    object txtClockRate: TEdit
      Left = 88
      Top = 162
      Width = 153
      Height = 23
      AutoSize = False
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 3
      Text = '1000'
    end
    object txtSectionLength: TEdit
      Left = 88
      Top = 122
      Width = 153
      Height = 23
      AutoSize = False
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 4
      Text = '1024'
    end
  end
  object GroupBox2: TGroupBox
    Left = 340
    Top = 55
    Width = 293
    Height = 163
    Caption = 'Trigger settings'
    TabOrder = 4
    object Label6: TLabel
      Left = 10
      Top = 23
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Source:'
    end
    object Label9: TLabel
      Left = 10
      Top = 59
      Width = 73
      Height = 17
      AutoSize = False
      Caption = 'Edge:'
    end
    object Label10: TLabel
      Left = 9
      Top = 91
      Width = 65
      Height = 17
      AutoSize = False
      Caption = 'Delay count:'
    end
    object Label11: TLabel
      Left = 8
      Top = 127
      Width = 73
      Height = 17
      AutoSize = False
      Caption = 'Trigger level:'
    end
    object Label12: TLabel
      Left = 272
      Top = 128
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object cmbTriggerSource: TComboBox
      Left = 88
      Top = 22
      Width = 177
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbTriggerSourceChange
    end
    object cmbTriggerEdge: TComboBox
      Left = 88
      Top = 55
      Width = 177
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      TabOrder = 1
    end
    object txtTriggerLevel: TEdit
      Left = 88
      Top = 121
      Width = 176
      Height = 27
      AutoSize = False
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 2
      Text = '3'
    end
    object txtDelayCount: TEdit
      Left = 88
      Top = 85
      Width = 176
      Height = 27
      AutoSize = False
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 3
      Text = '500'
    end
  end
  object txtProfilePath: TEdit
    Left = 368
    Top = 20
    Width = 185
    Height = 21
    TabOrder = 5
  end
  object btnBrowse: TButton
    Left = 568
    Top = 18
    Width = 51
    Height = 22
    Caption = 'Browse'
    TabOrder = 6
    OnClick = btnBrowseClick
  end
end