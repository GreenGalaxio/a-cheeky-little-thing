// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_jab_18

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class metaknight_jab_18 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var controls:Object;

        public function metaknight_jab_18()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 7, this.frame8, 9, this.frame10, 11, this.frame12, 14, this.frame15, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame4():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON2)
            {
                gotoAndPlay("loop");
            };
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

