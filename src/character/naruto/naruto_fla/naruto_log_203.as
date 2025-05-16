// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_log_203

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class naruto_log_203 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var landed:*;

        public function naruto_log_203()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 13, this.frame14, 23, this.frame24);
        }

        public function toContinue(_arg_1:Event=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            this.landed = true;
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.landed = false;
            };
        }

        internal function frame9():*
        {
            this.self.updateProjectileStats({"gravity":1});
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
        }

        internal function frame14():*
        {
            gotoAndPlay("loop");
        }

        internal function frame24():*
        {
            this.self.destroy();
        }


    }
}//package naruto_fla

