// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_aerial_down2_175

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

    public dynamic class mario_aerial_down2_175 extends MovieClip 
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
        public var landingBool:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function mario_aerial_down2_175()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 11, this.frame12, 12, this.frame13, 16, this.frame17, 19, this.frame20, 26, this.frame27);
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
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            }
            else
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.landingBool = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("brawl_swing_l");
                this.landingLag(false);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame3():*
        {
            this.landingLag(true);
            this.self.attachEffect("dairSparkle");
        }

        internal function frame5():*
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
        }

        internal function frame6():*
        {
            SSF2API.playSound("mario_spin");
        }

        internal function frame7():*
        {
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            SSF2API.playSound("mario_spin");
        }

        internal function frame9():*
        {
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame12():*
        {
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            this.landingLag(false);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

