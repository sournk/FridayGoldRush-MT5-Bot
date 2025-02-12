//+------------------------------------------------------------------+
//|                                                   CFGRInputs.mqh |
//|                                                  Denis Kislitsyn |
//|                                             https://kislitsyn.me |
//+------------------------------------------------------------------+

// Field naming convention:
//  1. With the prefix '__' the field will not be declared for user input
//  2. With the prefix '_' the field will be declared as 'sinput'
//  3. otherwise it will be declared as 'input'

#include "Include\DKStdLib\Common\DKStdLib.mqh"


// PARSING AREA OF INPUT STRUCTURE == START == DO NOT REMOVE THIS COMMENT
struct CFGRBotInputs {
  // input  group                    "1. ENTER (ENT)"
  uint                        ENT_WD;                   // ENT_WD: Enter Weekday (0-SUN, 1-MON, ...) // 4(x <= 6)
  uint                        ENT_HR;                   // ENT_HR: Enter Hour (0-23) // 14(x <= 23)
  uint                        ENT_MN;                   // ENT_MN: Enter Min (0-59) // 15(x <= 59)
  ENUM_POSITION_TYPE          ENT_DIR;                  // ENT_DIR: Enter direction // POSITION_TYPE_BUY
  double                      ENT_LOT;                  // ENT_LOT: Lot Size // 0.01(x > 0)
  uint                        ENT_SL_PNT;               // ENT_SL_PNT: Stop loss, pnt (0-off) // 0

  // input  group                    "2. EXIT (EXT)"
  uint                        EXT_WD;                   // ENT_WD: Exit Weekday (0-SUN, 1-MON, ...) // 5(x <= 6)
  uint                        EXT_HR;                   // ENT_HR: Exit Hour (0-23) // 18(x <= 23)
  uint                        EXT_MN;                   // ENT_MN: Exit Min (0-59) // 25(x <= 59)  
    
  // input  group                    "3. РАЗНОЕ (MS)"
  ulong                       _MS_MGC;                  // MS_MGC: Expert Adviser ID - Magic // 20250206
  string                      _MS_EGP;                  // MS_EGP: Expert Adviser Global Prefix // "FGR"
  LogLevel                    _MS_LOG_LL;               // MS_LOG_LL: Log Level // INFO
  string                      _MS_LOG_FI;               // MS_LOG_FI: Log Filter IN String (use `;` as sep) // ""
  string                      _MS_LOG_FO;               // MS_LOG_FO: Log Filter OUT String (use `;` as sep) // ""
  bool                        _MS_COM_EN;               // MS_COM_EN: Comment Enable (turn off for fast testing) // true
  uint                        _MS_COM_IS;               // MS_COM_IS: Comment Interval, Sec // 30
  bool                        __MS_COM_CW;              // MS_COM_EW: Comment Custom Window // false
  uint                        __MS_TIM_MS;              // MS_TIM_MS: Timer Interval, ms // 30000
  uint                        __MS_LIC_DUR_SEC;         // MS_LIC_DUR_SEC: License Duration, Sec // 0*24*60*60
  
  
// PARSING AREA OF INPUT STRUCTURE == END == DO NOT REMOVE THIS COMMENT

  string LastErrorMessage;
  bool CFGRBotInputs::InitAndCheck();
  bool CFGRBotInputs::Init();
  bool CFGRBotInputs::CheckBeforeInit();
  bool CFGRBotInputs::CheckAfterInit();
  void CFGRBotInputs::CFGRBotInputs();
  
  
  // IND HNDLs
};

//+------------------------------------------------------------------+
//| Init struc and Check values
//+------------------------------------------------------------------+
bool CFGRBotInputs::InitAndCheck(){
  LastErrorMessage = "";

  if (!CheckBeforeInit())
    return false;

  if (!Init()) {
    LastErrorMessage = "Input.Init() failed";
    return false;
  }

  return CheckAfterInit();
}

//+------------------------------------------------------------------+
//| Init struc
//+------------------------------------------------------------------+
bool CFGRBotInputs::Init(){
  return true;
}

//+------------------------------------------------------------------+
//| Check struc after Init
//+------------------------------------------------------------------+
bool CFGRBotInputs::CheckAfterInit(){
  LastErrorMessage = "";

  return LastErrorMessage == "";
}

// GENERATED CODE == START == DO NOT REMOVE THIS COMMENT

input  group                    "1. ENTER (ENT)"
input  uint                      Inp_ENT_WD                         = 4;                 // ENT_WD: Enter Weekday (0-SUN, 1-MON, ...)
input  uint                      Inp_ENT_HR                         = 14;                // ENT_HR: Enter Hour (0-23)
input  uint                      Inp_ENT_MN                         = 15;                // ENT_MN: Enter Min (0-59)
input  ENUM_POSITION_TYPE        Inp_ENT_DIR                        = POSITION_TYPE_BUY; // ENT_DIR: Enter direction
input  double                    Inp_ENT_LOT                        = 0.01;              // ENT_LOT: Lot Size
input  uint                      Inp_ENT_SL_PNT                     = 0;                 // ENT_SL_PNT: Stop loss, pnt (0-off)

input  group                    "2. EXIT (EXT)"
input  uint                      Inp_EXT_WD                         = 5;                 // ENT_WD: Exit Weekday (0-SUN, 1-MON, ...)
input  uint                      Inp_EXT_HR                         = 18;                // ENT_HR: Exit Hour (0-23)
input  uint                      Inp_EXT_MN                         = 25;                // ENT_MN: Exit Min (0-59)

input  group                    "3. РАЗНОЕ (MS)"
sinput ulong                     Inp__MS_MGC                        = 20250206;          // MS_MGC: Expert Adviser ID - Magic
sinput string                    Inp__MS_EGP                        = "FGR";             // MS_EGP: Expert Adviser Global Prefix
sinput LogLevel                  Inp__MS_LOG_LL                     = INFO;              // MS_LOG_LL: Log Level
sinput string                    Inp__MS_LOG_FI                     = "";                // MS_LOG_FI: Log Filter IN String (use `;` as sep)
sinput string                    Inp__MS_LOG_FO                     = "";                // MS_LOG_FO: Log Filter OUT String (use `;` as sep)
sinput bool                      Inp__MS_COM_EN                     = true;              // MS_COM_EN: Comment Enable (turn off for fast testing)
sinput uint                      Inp__MS_COM_IS                     = 30;                // MS_COM_IS: Comment Interval, Sec


//+------------------------------------------------------------------+
//| Fill Input struc with user inputs vars
//+------------------------------------------------------------------+    
void FillInputs(CFGRBotInputs& _inputs) {
  _inputs.ENT_WD                    = Inp_ENT_WD;                                        // ENT_WD: Enter Weekday (0-SUN, 1-MON, ...)
  _inputs.ENT_HR                    = Inp_ENT_HR;                                        // ENT_HR: Enter Hour (0-23)
  _inputs.ENT_MN                    = Inp_ENT_MN;                                        // ENT_MN: Enter Min (0-59)
  _inputs.ENT_DIR                   = Inp_ENT_DIR;                                       // ENT_DIR: Enter direction
  _inputs.ENT_LOT                   = Inp_ENT_LOT;                                       // ENT_LOT: Lot Size
  _inputs.ENT_SL_PNT                = Inp_ENT_SL_PNT;                                    // ENT_SL_PNT: Stop loss, pnt (0-off)
  _inputs.EXT_WD                    = Inp_EXT_WD;                                        // ENT_WD: Exit Weekday (0-SUN, 1-MON, ...)
  _inputs.EXT_HR                    = Inp_EXT_HR;                                        // ENT_HR: Exit Hour (0-23)
  _inputs.EXT_MN                    = Inp_EXT_MN;                                        // ENT_MN: Exit Min (0-59)
  _inputs._MS_MGC                   = Inp__MS_MGC;                                       // MS_MGC: Expert Adviser ID - Magic
  _inputs._MS_EGP                   = Inp__MS_EGP;                                       // MS_EGP: Expert Adviser Global Prefix
  _inputs._MS_LOG_LL                = Inp__MS_LOG_LL;                                    // MS_LOG_LL: Log Level
  _inputs._MS_LOG_FI                = Inp__MS_LOG_FI;                                    // MS_LOG_FI: Log Filter IN String (use `;` as sep)
  _inputs._MS_LOG_FO                = Inp__MS_LOG_FO;                                    // MS_LOG_FO: Log Filter OUT String (use `;` as sep)
  _inputs._MS_COM_EN                = Inp__MS_COM_EN;                                    // MS_COM_EN: Comment Enable (turn off for fast testing)
  _inputs._MS_COM_IS                = Inp__MS_COM_IS;                                    // MS_COM_IS: Comment Interval, Sec
}


//+------------------------------------------------------------------+
//| Constructor
//+------------------------------------------------------------------+
void CFGRBotInputs::CFGRBotInputs():
       ENT_WD(4),
       ENT_HR(14),
       ENT_MN(15),
       ENT_DIR(POSITION_TYPE_BUY),
       ENT_LOT(0.01),
       EXT_WD(5),
       EXT_HR(18),
       EXT_MN(25),
       _MS_MGC(20250206),
       _MS_EGP("FGR"),
       _MS_LOG_LL(INFO),
       _MS_LOG_FI(""),
       _MS_LOG_FO(""),
       _MS_COM_EN(true),
       _MS_COM_IS(30),
       __MS_COM_CW(false),
       __MS_TIM_MS(30000),
       __MS_LIC_DUR_SEC(0*24*60*60){

};


//+------------------------------------------------------------------+
//| Check struc before Init
//+------------------------------------------------------------------+
bool CFGRBotInputs::CheckBeforeInit() {
  LastErrorMessage = "";
  if(!(ENT_WD <= 6)) LastErrorMessage = "'ENT_WD' must satisfy condition: ENT_WD <= 6";
  if(!(ENT_HR <= 23)) LastErrorMessage = "'ENT_HR' must satisfy condition: ENT_HR <= 23";
  if(!(ENT_MN <= 59)) LastErrorMessage = "'ENT_MN' must satisfy condition: ENT_MN <= 59";
  if(!(ENT_LOT > 0)) LastErrorMessage = "'ENT_LOT' must satisfy condition: ENT_LOT > 0";
  if(!(EXT_WD <= 6)) LastErrorMessage = "'EXT_WD' must satisfy condition: EXT_WD <= 6";
  if(!(EXT_HR <= 23)) LastErrorMessage = "'EXT_HR' must satisfy condition: EXT_HR <= 23";
  if(!(EXT_MN <= 59)) LastErrorMessage = "'EXT_MN' must satisfy condition: EXT_MN <= 59";

  return LastErrorMessage == "";
}
// GENERATED CODE == END == DO NOT REMOVE THIS COMMENT



