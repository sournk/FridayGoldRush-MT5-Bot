//+------------------------------------------------------------------+
//|                                                      CFGRBot.mqh |
//|                                                  Denis Kislitsyn |
//|                                             https://kislitsyn.me |
//+------------------------------------------------------------------+

//#include <Generic\HashMap.mqh>
//#include <Arrays\ArrayString.mqh>
//#include <Arrays\ArrayObj.mqh>
//#include <Arrays\ArrayDouble.mqh>
//#include <Arrays\ArrayLong.mqh>
//#include <Trade\TerminalInfo.mqh>
//#include <Trade\DealInfo.mqh>
//#include <Charts\Chart.mqh>
//#include <Math\Stat\Math.mqh>
//#include <Trade\OrderInfo.mqh>

//#include <ChartObjects\ChartObjectsShapes.mqh>
//#include <ChartObjects\ChartObjectsLines.mqh>
//#include <ChartObjects\ChartObjectsArrows.mqh> 

//#include "Include\DKStdLib\Analysis\DKChartAnalysis.mqh"
//#include "Include\DKStdLib\Common\DKNumPy.mqh"
//#include "Include\DKStdLib\Common\CDKBarTag.mqh"

//#include "Include\DKStdLib\Common\CDKString.mqh"
//#include "Include\DKStdLib\Logger\CDKLogger.mqh"
//#include "Include\DKStdLib\TradingManager\CDKPositionInfo.mqh"
//#include "Include\DKStdLib\TradingManager\CDKTrade.mqh"
//#include "Include\DKStdLib\TradingManager\CDKTSLStep.mqh"
//#include "Include\DKStdLib\TradingManager\CDKTSLStepSpread.mqh"
//#include "Include\DKStdLib\TradingManager\CDKTSLFibo.mqh"
//#include "Include\DKStdLib\TradingManager\CDKTSLPriceChannel.mqh"
//#include "Include\DKStdLib\Drawing\DKChartDraw.mqh"
//#include "Include\DKStdLib\History\DKHistory.mqh"

//#include "Include\DKStdLib\Common\CDKString.mqh"
//#include "Include\DKStdLib\Common\DKDatetime.mqh"
//#include "Include\DKStdLib\Arrays\CDKArrayString.mqh"
#include "Include\DKStdLib\Bot\CDKBaseBot.mqh"

//#include "Include\fxsaber\Calendar\Calendar.mqh"
//#include "Include\fxsaber\Calendar\DST.mqh"

#include "CFGRInputs.mqh"


enum ENUM_FGR_RETCODE {
  FGR_SUCCESS               = 0,
  
  FGR_POS_IN_MARKET         = 100,  
  FGR_NO_POS_IN_MARKET      = 200,  
  FGR_WRONG_WEEKDAY         = 300,  
  FGR_WRONG_TIME            = 400,  
  
  FGR_ERROR_TRADE           = 500,  
  
};

class CFGRBot : public CDKBaseBot<CFGRBotInputs> {
public: // SETTINGS

protected:
public:
  // Constructor & init
  //void                       CFGRBot::CFGRBot(void);
  void                       CFGRBot::~CFGRBot(void);
  void                       CFGRBot::InitChild();
  bool                       CFGRBot::Check(void);

  // Event Handlers
  void                       CFGRBot::OnDeinit(const int reason);
  void                       CFGRBot::OnTick(void);
  void                       CFGRBot::OnTrade(void);
  void                       CFGRBot::OnTimer(void);
  double                     CFGRBot::OnTester(void);
  void                       CFGRBot::OnBar(void);
  
  // Bot's logic
  LogLevel                   CFGRBot::GetLogLevelByRetCode(const ENUM_FGR_RETCODE _ret_code);
  
  void                       CFGRBot::UpdateComment(const bool _ignore_interval = false);

  ENUM_FGR_RETCODE           CFGRBot::OpenOnTime();
  ENUM_FGR_RETCODE           CFGRBot::CloseOnTime();
};

//+------------------------------------------------------------------+
//| Destructor
//+------------------------------------------------------------------+
void CFGRBot::~CFGRBot(void){
}


//+------------------------------------------------------------------+
//| Inits bot
//+------------------------------------------------------------------+
void CFGRBot::InitChild() {
  // Put code here

  UpdateComment(true);
}

//+------------------------------------------------------------------+
//| Check bot's params
//+------------------------------------------------------------------+
bool CFGRBot::Check(void) {
  if(!CDKBaseBot<CFGRBotInputs>::Check())
    return false;
    
  if(!Inputs.InitAndCheck()) {
    Logger.Critical(Inputs.LastErrorMessage, true);
    return false;
  }
  
  // Put your additional checks here
 
  return true;
}

//+------------------------------------------------------------------+
//| OnDeinit Handler
//+------------------------------------------------------------------+
void CFGRBot::OnDeinit(const int reason) {
}

//+------------------------------------------------------------------+
//| OnTick Handler
//+------------------------------------------------------------------+
void CFGRBot::OnTick(void) {
  CDKBaseBot<CFGRBotInputs>::OnTick(); // Check new bar and show comment
  
//  // 03. Channels update
//  bool need_update = false;
//
//  // 06. Update comment
//  if(need_update)
//    UpdateComment(true);
}

//+------------------------------------------------------------------+
//| OnBar Handler
//+------------------------------------------------------------------+
void CFGRBot::OnBar(void) {
  ENUM_FGR_RETCODE rc_close = CloseOnTime();
  LogLevel lev_close = GetLogLevelByRetCode(rc_close);
  Logger.Log(LSF(StringFormat("Close on time: RET_CODE=%s", EnumToString(rc_close))), lev_close);
  
  ENUM_FGR_RETCODE rc_open = OpenOnTime();
  LogLevel lev_open = GetLogLevelByRetCode(rc_open);
  Logger.Log(LSF(StringFormat("Open on time: RET_CODE=%s", EnumToString(rc_open))), lev_open);  
}

//+------------------------------------------------------------------+
//| OnTrade Handler
//+------------------------------------------------------------------+
void CFGRBot::OnTrade(void) {
  CDKBaseBot<CFGRBotInputs>::OnTrade();
}

//+------------------------------------------------------------------+
//| OnTimer Handler
//+------------------------------------------------------------------+
void CFGRBot::OnTimer(void) {
  CDKBaseBot<CFGRBotInputs>::OnTimer();
}

//+------------------------------------------------------------------+
//| OnTester Handler
//+------------------------------------------------------------------+
double CFGRBot::OnTester(void) {
  return 0;
}



//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Bot's logic
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| Log Level for RET_CODE
//+------------------------------------------------------------------+
LogLevel CFGRBot::GetLogLevelByRetCode(const ENUM_FGR_RETCODE _ret_code) {
  LogLevel lev = INFO;
  if(_ret_code == FGR_SUCCESS) lev = WARN;
  if(_ret_code == FGR_ERROR_TRADE) lev = ERROR;
  
  return lev;
}

//+------------------------------------------------------------------+
//| Updates comment
//+------------------------------------------------------------------+
void CFGRBot::UpdateComment(const bool _ignore_interval = false) {
  ClearComment();

  datetime dt_curr = TimeCurrent();
  AddCommentLine(StringFormat("Time: %s %s", WeekDayShortNameEN[TimeToWeekDay(dt_curr)], TimeToString(dt_curr)));

  ShowComment(_ignore_interval);     
}

//+------------------------------------------------------------------+
//| Open On Signal
//+------------------------------------------------------------------+
ENUM_FGR_RETCODE CFGRBot::OpenOnTime() {
  datetime dt_curr = TimeCurrent();
  
  if(Poses.Total()) return FGR_POS_IN_MARKET;
  
  if(TimeToWeekDay(dt_curr) != Inputs.ENT_WD) return FGR_WRONG_WEEKDAY;
  
  datetime dt_enter = StringToTime(StringFormat("%d:%d", Inputs.ENT_HR, Inputs.ENT_MN));
  if(TimeBeginning(dt_curr, DATETIME_PART_MIN) != TimeBeginning(dt_enter, DATETIME_PART_MIN)) return FGR_WRONG_TIME;
  
  double ep = Sym.GetPriceToOpen(Inputs.ENT_DIR);
  uint sl_dist = Inputs.ENT_SL_PNT;
  double sl = (sl_dist > 0) ? Sym.AddToPrice(Inputs.ENT_DIR, ep, -1*sl_dist) : 0.0;
  double tp = 0;
  double lot = Sym.NormalizeLot(Inputs.ENT_LOT);
  string comment = Logger.Name;
  
  ulong ticket = 0;
  if(Inputs.ENT_DIR == POSITION_TYPE_BUY) 
    ticket = Trade.Buy(lot, Sym.Name(), ep, sl, tp, comment);
  else
    ticket = Trade.Sell(lot, Sym.Name(), ep, sl, tp, comment);
    
  LSF_ASSERT(ticket > 0,
             StringFormat("TICKET=%I64u; RET_CODE=%d; DIR=%s; LOT=%0.2f; MSG='%s'",
                          ticket,
                          Trade.ResultRetcode(),
                          PositionTypeToString(Inputs.ENT_DIR), lot, 
                          Trade.ResultRetcodeDescription()
                         ),
             WARN, ERROR);
  
  return (ticket > 0) ? FGR_SUCCESS : FGR_ERROR_TRADE;
} 


//+------------------------------------------------------------------+
//| Close pos on time
//+------------------------------------------------------------------+
ENUM_FGR_RETCODE CFGRBot::CloseOnTime() { 
  datetime dt_curr = TimeCurrent();
  
  if(TimeToWeekDay(dt_curr) != Inputs.EXT_WD) return FGR_WRONG_WEEKDAY;

  datetime dt_exit = StringToTime(StringFormat("%d:%d", Inputs.EXT_HR, Inputs.EXT_MN));
  if(TimeBeginning(dt_curr, DATETIME_PART_MIN) != TimeBeginning(dt_exit, DATETIME_PART_MIN)) return FGR_WRONG_TIME;
  
  if(Poses.Total() <= 0) return FGR_NO_POS_IN_MARKET; 
  
  bool res = Trade.PositionClose(Poses.At(0));
  
  LSF_ASSERT(res,
             StringFormat("TICKET=%I64u; RET_CODE=%d; MSG='%s'",
                          Poses.At(0),
                          Trade.ResultRetcode(),
                          Trade.ResultRetcodeDescription()
                         ),
             WARN, ERROR);  
  
  return res ? FGR_SUCCESS : FGR_ERROR_TRADE;     
}