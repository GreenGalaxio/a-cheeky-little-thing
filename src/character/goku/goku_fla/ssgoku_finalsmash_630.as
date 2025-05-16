// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_finalsmash_630

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

    public dynamic class ssgoku_finalsmash_630 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;

        public function ssgoku_finalsmash_630()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 41, this.frame42);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.shakeCamera(17);
                SSF2API.lightFlash();
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame42():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

