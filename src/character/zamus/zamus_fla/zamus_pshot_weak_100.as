// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_pshot_weak_100

package zamus_fla
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

    public dynamic class zamus_pshot_weak_100 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var speed:Number;
        public var time:int;

        public function zamus_pshot_weak_100()
        {
            addFrameScript(0, this.frame1);
        }

        public function destroy(_arg_1:*):*
        {
            SSF2API.print(((this.self.getLinkageID() + ": ") + _arg_1.toString()));
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.destroy);
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.speed = 0;
            this.time = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.destroy);
            };
        }


    }
}//package zamus_fla

