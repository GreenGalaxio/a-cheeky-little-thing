// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_fireballthrow_special_83

package mario_fla
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

    public dynamic class mario_fireballthrow_special_83 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_fireballthrow_special_83()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 13, this.frame14, 14, this.frame15, 53, this.frame54, 124, this.frame125);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "charging";
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame5():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame6():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }

        internal function frame15():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(3);
            this.self.modifyAirEase(0);
        }

        internal function frame54():*
        {
            this.self.playAttackSound(3);
            this.self.playVoiceSound(4);
        }

        internal function frame125():*
        {
            this.self.endFinalForm();
            this.self.endAttack();
        }


    }
}//package mario_fla

