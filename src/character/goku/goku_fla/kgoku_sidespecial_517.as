// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_sidespecial_517

package goku_fla
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

    public dynamic class kgoku_sidespecial_517 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var waiting:*;
        public var hasHit:*;
        public var xframe:String;

        public function kgoku_sidespecial_517()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 10, this.frame11, 16, this.frame17, 26, this.frame27);
        }

        public function moveForward():*
        {
            this.self.setXSpeed(20, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.waiting = false;
                this.hasHit = false;
                this.xframe = null;
                SSF2API.shakeCamera(5);
                this.self.playVoiceSound(1);
            };
        }

        internal function frame3():*
        {
            SSF2API.shakeCamera(15);
        }

        internal function frame11():*
        {
            SSF2API.createTimer(this.self, 1, 12, this.moveForward);
            this.self.playAttackSound(1);
            SSF2API.shakeCamera(20);
        }

        internal function frame17():*
        {
            SSF2API.shakeCamera(10);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

