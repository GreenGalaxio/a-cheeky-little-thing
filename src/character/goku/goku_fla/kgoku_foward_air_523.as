// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_foward_air_523

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class kgoku_foward_air_523 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function kgoku_foward_air_523()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame6():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            SSF2API.shakeCamera(8);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

