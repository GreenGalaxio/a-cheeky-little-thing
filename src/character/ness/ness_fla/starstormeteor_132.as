// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.starstormeteor_132

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class starstormeteor_132 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var deathBounds:*;

        public function starstormeteor_132()
        {
            addFrameScript(0, this.frame1, 8, this.frame9);
        }

        public function checkDeath():*
        {
            if (((SSF2API.isReady()) && (this.self)))
            {
                if (this.self.getY() >= (this.deathBounds.width + this.self.getHeight()))
                {
                    this.self.destroy();
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.deathBounds = SSF2API.getDeathBounds();
                this.self.setScale(3.5, 3.5);
                this.self.createTimer(1, 0, this.checkDeath);
            };
        }

        internal function frame9():*
        {
            gotoAndPlay("loop");
        }


    }
}//package ness_fla

