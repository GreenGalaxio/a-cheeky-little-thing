// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_sideB_air_58

package jigglypuff_fla
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

    public dynamic class jiggly_sideB_air_58 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var speed:*;
        public var controls:Object;
        public var down:*;

        public function jiggly_sideB_air_58()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 20, this.frame21, 21, this.frame22);
        }

        public function downSlow():void
        {
            if (this.down)
            {
                this.self.setXSpeed((this.self.getXSpeed() * 0.85));
                this.self.setYSpeed((this.self.getYSpeed() * 0.85));
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.speed = 8;
            this.controls = null;
            this.down = false;
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            this.self.updateAttackStats({
                "allowControl":false,
                "air_ease":0,
                "allowFastFall":false
            });
            if (this.controls.UP)
            {
                this.self.setXSpeed((this.speed * Math.cos(((45 * Math.PI) / 180))), false);
                if (!this.self.isOnGround())
                {
                    this.self.setYSpeed(((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180))));
                };
            }
            else
            {
                if (this.controls.DOWN)
                {
                    this.down = true;
                    this.self.setXSpeed((this.speed + (3 * Math.cos(((315 * Math.PI) / 180)))), false);
                    if (!this.self.isOnGround())
                    {
                        this.self.setYSpeed((this.speed * Math.cos(((315 * Math.PI) / 180))));
                    };
                    this.self.updateAttackStats({"air_ease":6});
                }
                else
                {
                    this.self.setXSpeed(this.speed, false);
                };
            };
        }

        internal function frame6():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.downSlow();
        }

        internal function frame8():*
        {
            this.downSlow();
        }

        internal function frame9():*
        {
            this.downSlow();
        }

        internal function frame10():*
        {
            this.downSlow();
        }

        internal function frame11():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            this.downSlow();
        }

        internal function frame12():*
        {
            this.downSlow();
        }

        internal function frame13():*
        {
            this.downSlow();
        }

        internal function frame14():*
        {
            this.downSlow();
        }

        internal function frame15():*
        {
            this.downSlow();
        }

        internal function frame16():*
        {
            this.downSlow();
        }

        internal function frame17():*
        {
            this.downSlow();
        }

        internal function frame18():*
        {
            if (this.down)
            {
                this.self.setXSpeed(0);
                this.self.setYSpeed(0);
            };
        }

        internal function frame21():*
        {
            this.self.setXSpeed(1, false);
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

