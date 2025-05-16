// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmbthrow_109

package blackmage_fla
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

    public dynamic class bmbthrow_109 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function bmbthrow_109()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 14, this.frame15, 15, this.frame16, 21, this.frame22, 24, this.frame25, 27, this.frame28, 43, this.frame44);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
        }

        internal function frame13():*
        {
            SSF2API.shakeCamera(5);
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.xframe = "attack";
        }

        internal function frame16():*
        {
            SSF2API.shakeCamera(5);
        }

        internal function frame22():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame25():*
        {
            SSF2API.shakeCamera(20);
        }

        internal function frame28():*
        {
            this.self.fireProjectile("bthrowrock");
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

