// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_nair_38

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

    public dynamic class metaknight_nair_38 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var audio:Number;

        public function metaknight_nair_38()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 5, this.frame6, 9, this.frame10, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.audio = SSF2API.playSound("mk_dodge");
            };
        }

        internal function frame3():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.playAttackSound(1);
        }

        internal function frame5():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":8,
                "kbConstant":70,
                "direction":40
            });
            this.self.updateAttackBoxStats(2, {
                "damage":8,
                "kbConstant":70,
                "direction":40
            });
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

