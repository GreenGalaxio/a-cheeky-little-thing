// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.warp_153

package blackmage_fla
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

    public dynamic class warp_153 extends MovieClip 
    {

        public var self:*;
        public var xframe:String;
        public var character:*;

        public function warp_153()
        {
            addFrameScript(0, this.frame1, 34, this.frame35, 45, this.frame46);
        }

        public function projDestroy(_arg_1:*):*
        {
            SSF2API.print("activated");
            SSF2API.removeEventListener(this.character, SSF2Event.CHAR_HURT, this.projDestroy);
            this.self.removeFromCamera();
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.xframe = "charging";
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.self.addToCamera();
                SSF2API.addEventListener(this.character, SSF2Event.CHAR_HURT, this.projDestroy);
            };
        }

        internal function frame35():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame46():*
        {
            this.self.destroy();
        }


    }
}//package blackmage_fla

