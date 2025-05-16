// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_pkfireproj_119

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class ness_pkfireproj_119 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function ness_pkfireproj_119()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 51, this.frame52, 59, this.frame60, 60, this.frame61);
        }

        public function goToAfterHit(_arg_1:*=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.goToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.goToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.goToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.destroy);
            this.gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.goToAfterHit);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.goToAfterHit);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.goToAfterHit);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.destroy);
            };
        }

        internal function frame4():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame5():*
        {
            this.self.updateProjectileStats({
                "time_max":56,
                "canBeReversed":false,
                "canBeAbsorbed":false
            });
            this.self.setXSpeed(0.001, false);
        }

        internal function frame6():*
        {
            this.self.updateProjectileStats({
                "gravity":1,
                "maxgravity":0.2
            });
        }

        internal function frame52():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":50,
                "kbConstant":20
            });
            this.self.refreshAttackID();
        }

        internal function frame60():*
        {
            this.self.destroy();
            stop();
        }

        internal function frame61():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package ness_fla

