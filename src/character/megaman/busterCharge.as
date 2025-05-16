// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//busterCharge

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

    public dynamic class busterCharge extends MovieClip 
    {

        public var self:*;
        public var character:*;
        public var bustCharge:*;

        public function busterCharge()
        {
            addFrameScript(0, this.frame1, 68, this.frame69);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.bustCharge = this.character.getCurrentProjectile();
                this.character.setGlobalVariable("bustCharge", this.bustCharge);
            };
        }

        internal function frame69():*
        {
            gotoAndPlay("loop");
        }


    }
}//package 

