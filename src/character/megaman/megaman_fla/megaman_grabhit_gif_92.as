// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_grabhit_gif_92

package megaman_fla
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

    public dynamic class megaman_grabhit_gif_92 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var damage:Number;

        public function megaman_grabhit_gif_92()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 10, this.frame11, 15, this.frame16, 16, this.frame17, 18, this.frame19, 20, this.frame21, 25, this.frame26, 31, this.frame32, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.damage = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.damage = this.self.getDamage();
                if (this.damage >= 100)
                {
                    gotoAndPlay("heavy");
                }
                else
                {
                    this.self.setIntangibility(true);
                };
            };
        }

        internal function frame5():*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(-4);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
            this.self.setIntangibility(false);
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame19():*
        {
            this.self.updateAttackBoxStats({
                "attackDamage":11,
                "direction":60,
                "hitStun":6,
                "selfHitStun":3
            });
        }

        internal function frame21():*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(-3);
        }

        internal function frame26():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame32():*
        {
            this.self.setYSpeed(-2);
            this.self.setXSpeed(4, false);
            this.self.playAttackSound(1);
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

