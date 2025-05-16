// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dkong_hud

package 
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

    public dynamic class dkong_hud extends MovieClip 
    {

        public var self:*;

        public function dkong_hud()
        {
            addFrameScript(0, this.frame1, 19, this.frame20, 58, this.frame59, 63, this.frame64, 84, this.frame85, 96, this.frame97);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getProjectile(this.projectile_id);
            };
            if (SSF2API.isReady())
            {
                this.visible = false;
            };
        }

        internal function frame20():*
        {
            this.visible = true;
        }

        internal function frame59():*
        {
            this.gotoAndPlay("idle");
        }

        internal function frame64():*
        {
            this.gotoAndPlay("idle");
        }

        internal function frame85():*
        {
            this.gotoAndPlay("getBarrel");
        }

        internal function frame97():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

