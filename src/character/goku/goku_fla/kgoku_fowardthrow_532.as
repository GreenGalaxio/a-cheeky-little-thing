// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_fowardthrow_532

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

    public dynamic class kgoku_fowardthrow_532 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kgoku_fowardthrow_532()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 10, this.frame11);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame3():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame4():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            SSF2API.shakeCamera(5);
        }

        internal function frame11():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

