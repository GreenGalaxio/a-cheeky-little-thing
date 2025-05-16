package com.mcleodgaming.ssf2.controllers
{
    public class GameSettings 
    {

        public var sizeRatio:Number;
        public var lives:int;
        public var stamina:int;
        public var time:int;
        public var countdown:Boolean;
        public var usingTime:Boolean;
        public var usingLives:Boolean;
        public var showPlayerID:Boolean;
        public var damageRatio:Number;
        public var startDamage:int;
        public var teams:Boolean;
        public var teamDamage:Boolean;
        public var hazards:Boolean;
        public var specialModes:uint;
        public var randSeed:Number;

        public function GameSettings()
        {
            this.sizeRatio = 1;
            this.lives = 1;
            this.stamina = 0;
            this.time = 2;
            this.countdown = true;
            this.usingTime = true;
            this.usingLives = false;
            this.showPlayerID = false;
            this.startDamage = 0;
            this.damageRatio = 1;
            this.teams = false;
            this.teamDamage = false;
            this.hazards = true;
            this.specialModes = 0;
            this.randSeed = 0;
        }

        public function exportSettings():Object
        {
            return ({
                "sizeRatio":this.sizeRatio,
                "lives":this.lives,
                "stamina":this.stamina,
                "time":this.time,
                "countdown":this.countdown,
                "usingTime":this.usingTime,
                "usingLives":this.usingLives,
                "showPlayerID":this.showPlayerID,
                "startDamage":this.startDamage,
                "damageRatio":this.damageRatio,
                "teams":this.teams,
                "teamDamage":this.teamDamage,
                "hazards":this.hazards,
                "specialModes":this.specialModes,
                "randSeed":this.randSeed
            });
        }

        public function importSettings(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (this[_local_2] !== undefined)
                {
                    this[_local_2] = _arg_1[_local_2];
                }
                else
                {
                    trace((('You tried to set "' + _local_2) + "\" but it doesn't exist in the GameSetting class."));
                };
            };
        }


    }
}//package com.mcleodgaming.ssf2.controllers