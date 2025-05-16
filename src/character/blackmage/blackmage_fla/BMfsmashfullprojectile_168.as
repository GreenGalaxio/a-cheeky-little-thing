// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.BMfsmashfullprojectile_168

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

    public dynamic class BMfsmashfullprojectile_168 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var speed:*;
        public var self:*;

        public function BMfsmashfullprojectile_168()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 39, this.frame40, 64, this.frame65);
        }

        public function toContinue(_arg_1:*):*
        {
            gotoAndPlay("continue");
        }

        public function wallBounce(_arg_1:*):*
        {
            this.self.setXSpeed(-(this.speed));
        }

        internal function frame1():*
        {
            this.speed = 4;
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.setXSpeed(this.speed, false);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.wallBounce);
            };
        }

        internal function frame10():*
        {
            SSF2API.playSound("bmbolt");
        }

        internal function frame40():*
        {
        }

        internal function frame65():*
        {
            gotoAndPlay("loop");
        }


    }
}//package blackmage_fla

