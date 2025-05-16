// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmfair2_89

package blackmage_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class bmfair2_89 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var boost:Number;
        public var dogl:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function bmfair2_89()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 17, this.frame18);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({
                "cancelWhenAirborne":true,
                "allowControl":false
            });
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.boost = 9.5;
                this.dogl = true;
                this.self.setGlobalVariable("Boost", 0);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame3():*
        {
            SSF2API.playSound("bm_chocobocut");
            this.self.setXSpeed(8, false);
            if (((this.playsound > 0.4) && (this.playsound <= 0.7)))
            {
                SSF2API.playSound("chocobo");
                this.self.setGlobalVariable("audio", 1);
            };
            if (((this.playsound > 0.7) && (this.playsound <= 0.9)))
            {
                SSF2API.playSound("chocobo2");
                this.self.setGlobalVariable("audio", 2);
            };
            if (((this.playsound > 0.9) && (this.playsound <= 1)))
            {
                SSF2API.playSound("chocobo3");
                this.self.setGlobalVariable("audio", 3);
            };
        }

        internal function frame4():*
        {
            this.boost--;
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.dogl = false;
        }

        internal function frame5():*
        {
            this.boost--;
        }

        internal function frame6():*
        {
            this.boost--;
        }

        internal function frame7():*
        {
            this.boost--;
        }

        internal function frame8():*
        {
            this.boost--;
        }

        internal function frame9():*
        {
            this.boost--;
        }

        internal function frame10():*
        {
            this.boost--;
        }

        internal function frame11():*
        {
            this.boost = 0;
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame13():*
        {
            this.dogl = true;
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }

        internal function frame15():*
        {
            this.self.setXSpeed(this.boost, false);
            if (this.boost)
            {
                this.self.setGlobalVariable("Boost", this.boost);
            };
        }

        internal function frame16():*
        {
            if (this.dogl)
            {
                this.self.endAttack();
            };
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

