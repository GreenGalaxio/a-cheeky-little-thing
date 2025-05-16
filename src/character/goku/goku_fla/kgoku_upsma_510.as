// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_upsma_510

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

    public dynamic class kgoku_upsma_510 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kgoku_upsma_510()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 14, this.frame15, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame6():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            SSF2API.shakeCamera(5);
        }

        internal function frame15():*
        {
            SSF2API.shakeCamera(15);
            SSF2API.playSound("Goku_mediumpunch");
            this.self.attachEffectOverlay("goku_dairEffect");
            this.self.playAttackSound(2);
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

