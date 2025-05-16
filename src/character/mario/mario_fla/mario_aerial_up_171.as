// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_aerial_up_171

package mario_fla
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

    public dynamic class mario_aerial_up_171 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var landingBool:Boolean;

        public function mario_aerial_up_171()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 11, this.frame12, 15, this.frame16);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function landingLag(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            }
            else
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            this.landingBool = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.landingLag(true);
            };
        }

        internal function frame3():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                SSF2API.playSound("mario_grunt1");
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                SSF2API.playSound("mario_grunt2");
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                SSF2API.playSound("mario_grunt3");
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                SSF2API.playSound("mario_grunt4");
                this.self.setGlobalVariable("audio", 4);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("brawl_swing_l");
            };
        }

        internal function frame8():*
        {
        }

        internal function frame9():*
        {
            this.landingLag(false);
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

