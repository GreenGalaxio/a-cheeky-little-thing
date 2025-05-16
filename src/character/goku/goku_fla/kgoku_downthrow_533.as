// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_downthrow_533

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

    public dynamic class kgoku_downthrow_533 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kgoku_downthrow_533()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 12, this.frame13);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.playAttackSound(1);
            };
        }

        internal function frame5():*
        {
            SSF2API.shakeCamera(7);
        }

        internal function frame6():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame7():*
        {
            SSF2API.lightFlash();
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

