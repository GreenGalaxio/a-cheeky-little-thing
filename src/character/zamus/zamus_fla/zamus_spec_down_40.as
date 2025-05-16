// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_spec_down_40

package zamus_fla
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

    public dynamic class zamus_spec_down_40 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var controls:Object;

        public function zamus_spec_down_40()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 12, this.frame13, 25, this.frame26, 26, this.frame27, 29, this.frame30, 33, this.frame34, 35, this.frame36, 60, this.frame61, 62, this.frame63, 77, this.frame78);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            this.self.setIntangibility(false);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.destroyTimer(this.self, this.buttonToKick);
            gotoAndPlay("continue");
        }

        public function buttonToKick(_arg_1:Event=null):*
        {
            this.controls = this.self.getControls();
            if (((this.controls) && ((this.controls.BUTTON1) || (this.controls.BUTTON2))))
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.destroyTimer(this.self, this.buttonToKick);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToKickContinue);
                if (((this.controls) && (this.controls.LEFT)))
                {
                    this.self.faceLeft();
                }
                else
                {
                    if (((this.controls) && (this.controls.RIGHT)))
                    {
                        this.self.faceRight();
                    }
                    else
                    {
                        this.self.flip();
                    };
                };
                gotoAndPlay("kick");
            };
        }

        public function jumpToKickContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToKickContinue);
            gotoAndPlay("continueKick");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
                this.controls = this.self.getControls();
                this.self.setIntangibility(true);
            };
        }

        internal function frame2():*
        {
            this.self.setYSpeed(-13.2);
            this.self.setXSpeed(7.8, false);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame13():*
        {
            SSF2API.createTimer(this.self, 1, 19, this.buttonToKick);
        }

        internal function frame26():*
        {
            SSF2API.destroyTimer(this.self, this.buttonToKick);
            this.self.flip();
            this.self.endAttack();
        }

        internal function frame27():*
        {
            this.self.flip();
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame34():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame36():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":9,
                "direction":90,
                "power":60,
                "kbConstant":90,
                "effectSound":"brawl_kick_m"
            });
        }

        internal function frame61():*
        {
            this.self.endAttack();
        }

        internal function frame63():*
        {
        }

        internal function frame78():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

