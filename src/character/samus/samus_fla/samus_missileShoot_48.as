// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_missileShoot_48

package samus_fla
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

    public dynamic class samus_missileShoot_48 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var isSuper:Boolean;

        public function samus_missileShoot_48()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 29, this.frame30, 40, this.frame41, 55, this.frame56);
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
            };
        }

        internal function frame11():*
        {
            this.self.fireProjectile("homingmissile");
            this.self.playAttackSound(1);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame41():*
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

