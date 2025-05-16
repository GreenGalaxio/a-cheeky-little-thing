// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.pika_Bdownboi_37

package pikachu_fla
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

    public dynamic class pika_Bdownboi_37 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var projectile:*;
        public var player:Object;
        public var xpos:*;
        public var ypos:*;
        public var projectile2:*;
        public var projectile3:*;
        public var onGround:Boolean;

        public function pika_Bdownboi_37()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 31, this.frame32, 33, this.frame34, 43, this.frame44);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame7():*
        {
            this.self.fireProjectile("thunder");
            this.projectile = this.self.getCurrentProjectile();
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.player = this.self;
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame10():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
            this.self.fireProjectile("thunder");
            this.projectile2 = this.self.getCurrentProjectile();
            this.projectile2.setX(this.projectile.getX());
        }

        internal function frame11():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame12():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame13():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
            this.self.fireProjectile("thunder");
            this.projectile3 = this.self.getCurrentProjectile();
            this.projectile3.setX(this.projectile.getX());
        }

        internal function frame14():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame15():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame16():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame17():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame18():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame19():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame20():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame21():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame22():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame23():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame24():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame25():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame26():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame27():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame28():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            };
        }

        internal function frame29():*
        {
            this.xpos = Math.abs((this.player.getX() - this.projectile.getX()));
            this.ypos = Math.abs((this.player.getY() - this.projectile.getY()));
            if (((this.xpos <= 30) && (this.ypos <= 30)))
            {
                gotoAndPlay("special");
            }
            else
            {
                this.self.endAttack();
            };
        }

        internal function frame30():*
        {
            this.self.resetMovement();
            this.onGround = true;
            this.onGround = this.self.isOnGround();
            if (!this.onGround)
            {
                this.self.setYSpeed(-8);
            };
            this.projectile.updateProjectileStats({
                "ghost":true,
                "linkAttackID":false
            });
            this.projectile.getStanceMC().gotoAndPlay("continue");
            this.self.playAttackSound(2);
        }

        internal function frame32():*
        {
            this.projectile2.updateProjectileStats({
                "ghost":true,
                "linkAttackID":false
            });
            this.projectile2.getStanceMC().gotoAndPlay("continue");
        }

        internal function frame34():*
        {
            this.projectile3.updateProjectileStats({
                "ghost":true,
                "linkAttackID":false
            });
            this.projectile3.getStanceMC().gotoAndPlay("continue");
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }


    }
}//package pikachu_fla

