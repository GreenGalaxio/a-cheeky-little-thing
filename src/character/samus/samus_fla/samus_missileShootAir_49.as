// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_missileShootAir_49

package samus_fla
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

    public dynamic class samus_missileShootAir_49 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var isSuper:Boolean;

        public function samus_missileShootAir_49()
        {
            addFrameScript(0, this.frame1, 11, this.frame12, 29, this.frame30, 36, this.frame37, 55, this.frame56);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.isSuper = false;
                if (this.self.getSmashTimer() < 4)
                {
                    this.isSuper = true;
                    gotoAndPlay("super");
                };
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame12():*
        {
            this.self.fireProjectile("homingmissile");
            this.self.playAttackSound(1);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame37():*
        {
            this.self.fireProjectile("powermissile");
            this.self.playAttackSound(1);
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

