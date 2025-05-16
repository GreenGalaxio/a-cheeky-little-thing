// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_combo_54

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class supersonic_combo_54 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var playsound:Number;
        public var audio:Number;
        public var pressed1:Boolean;
        public var pressed2:Boolean;

        public function supersonic_combo_54()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 6, this.frame7, 10, this.frame11, 11, this.frame12, 25, this.frame26);
        }

        public function updateControls():*
        {
            this.controls = this.self.getControls();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                this.controls = this.self.getControls();
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                SSF2API.createTimer(this.self, 1, 26, this.updateControls);
            };
            this.pressed1 = false;
            this.pressed2 = false;
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON2)
            {
                gotoAndPlay("hit2");
            }
            else
            {
                this.self.endAttack();
            };
        }

        internal function frame7():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON2)
            {
                gotoAndPlay("hit3");
            }
            else
            {
                this.self.endAttack();
            };
        }

        internal function frame12():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":49,
                "direction":31,
                "damage":3
            });
            this.self.updateAttackStats({
                "xSpeedDecay":0.4,
                "refreshRate":2
            });
            this.self.playVoiceSound(3);
            this.self.playAttackSound(3);
            this.self.setXSpeed(8, false);
            this.self.refreshAttackID();
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

