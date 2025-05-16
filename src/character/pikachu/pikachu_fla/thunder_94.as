// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.thunder_94

package pikachu_fla
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

    public dynamic class thunder_94 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var projectile:*;
        public var deathBounds:Object;

        public function thunder_94()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 15, this.frame16, 23, this.frame24);
        }

        internal function frame1():*
        {
            this.projectile = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.projectile)))
            {
                this.deathBounds = SSF2API.getDeathBounds();
                SSF2API.addEventListener(this.projectile, SSF2Event.GROUND_TOUCH, function ():*
                {
                    gotoAndPlay("continue");
                });
                this.projectile.setY(this.deathBounds.y);
            };
        }

        internal function frame2():*
        {
            this.projectile.setYSpeed(50);
        }

        internal function frame16():*
        {
            gotoAndPlay("loop");
        }

        internal function frame24():*
        {
            gotoAndStop("stopped");
        }


    }
}//package pikachu_fla

