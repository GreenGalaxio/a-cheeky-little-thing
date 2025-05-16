package com.mcleodgaming.ssf2.controllers
{
    public class PlayerSetting 
    {

        public var character:String;
        public var name:String;
        public var level:int;
        public var damageRatio:Number;
        public var orig_chipX:Number;
        public var orig_chipY:Number;
        public var chipX:Number;
        public var chipY:Number;
        public var human:Boolean;
        public var exist:Boolean;
        public var team:Number;
        public var costume:int;
        public var alternate:String;
        public var team_prev:Number;
        public var lives:Number;
        public var x_start:Number;
        public var y_start:Number;
        public var x_respawn:Number;
        public var y_respawn:Number;
        public var facingRight:Boolean;
        public var unlimitedFinal:Boolean;
        public var startDamage:int;
        public var expansion:int;
        public var isRandom:Boolean;

        public function PlayerSetting()
        {
            this.init();
        }

        public function init():void
        {
            this.character = null;
            this.name = null;
            this.level = 1;
            this.damageRatio = 1;
            this.orig_chipX = 0;
            this.orig_chipY = 0;
            this.chipX = 0;
            this.chipY = 0;
            this.human = true;
            this.exist = true;
            this.team = -1;
            this.costume = -1;
            this.alternate = null;
            this.team_prev = 1;
            this.lives = 0;
            this.x_start = 0;
            this.y_start = 0;
            this.x_respawn = 0;
            this.y_respawn = 0;
            this.facingRight = true;
            this.unlimitedFinal = false;
            this.startDamage = 0;
            this.expansion = 0;
            this.isRandom = false;
        }

        public function exportSettings():Object
        {
            return ({
                "character":this.character,
                "name":this.name,
                "level":this.level,
                "damageRatio":this.damageRatio,
                "orig_chipX":this.orig_chipX,
                "orig_chipY":this.orig_chipY,
                "chipX":this.chipX,
                "chipY":this.chipY,
                "human":this.human,
                "exist":this.exist,
                "team":this.team,
                "team_prev":this.team_prev,
                "costume":this.costume,
                "lives":this.lives,
                "x_start":this.x_start,
                "y_start":this.y_start,
                "x_respawn":this.x_respawn,
                "y_respawn":this.y_respawn,
                "facingRight":this.facingRight,
                "unlimitedFinal":this.unlimitedFinal,
                "startDamage":this.startDamage,
                "expansion":this.expansion,
                "isRandom":(this.character === "rand_mc")
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
                    trace((('You tried to set "' + _local_2) + "\" but it doesn't exist in the PlayerSetting class."));
                };
            };
        }


    }
}//package com.mcleodgaming.ssf2.controllers