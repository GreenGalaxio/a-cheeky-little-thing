// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_bair_42

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class metaknight_bair_42 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function metaknight_bair_42()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 6, this.frame7, 9, this.frame10, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame4():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.refreshAttackID();
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":150,
                "power":50,
                "kbConstant":90,
                "damage":7,
                "selfHitStun":0,
                "hitLag":-1.1,
                "reversableAngle":false
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

