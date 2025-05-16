// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.pika_finalsmash_85

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

    public dynamic class pika_finalsmash_85 extends MovieClip 
    {

        public var self:*;
        public var controls:Object;
        public var xCoor:Number;
        public var yCoor:Number;
        public var deathBounds:Object;
        public var projectile:*;
        public var counter:*;
        public var tempStat:*;

        public function pika_finalsmash_85()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 27, this.frame28, 28, this.frame29, 29, this.frame30);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.deathBounds = SSF2API.getDeathBounds();
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame28():*
        {
            this.projectile = null;
            this.counter = 40;
            this.self.fireProjectile("pika_fs");
        }

        internal function frame29():*
        {
            this.counter++;
            this.tempStat = 0;
            if (this.projectile == null)
            {
                this.projectile = this.self.getCurrentProjectile();
            };
            this.controls = this.self.getControls();
            if (!this.projectile.isDead())
            {
                if ((this.projectile.getX() - this.deathBounds.x) <= 0)
                {
                    this.tempStat = (this.deathBounds.x + 50);
                    this.projectile.setX(this.tempStat);
                };
                if ((this.projectile.getY() - this.deathBounds.y) <= 0)
                {
                    this.tempStat = (this.deathBounds.y + 50);
                    this.projectile.setY(this.tempStat);
                };
                if (((this.deathBounds.x + this.deathBounds.width) - this.projectile.getX()) <= 0)
                {
                    this.tempStat = ((this.deathBounds.x + this.deathBounds.width) - 50);
                    this.projectile.setX(this.tempStat);
                };
                if (((this.deathBounds.y + this.deathBounds.height) - this.projectile.getY()) <= 0)
                {
                    this.tempStat = ((this.deathBounds.y + this.deathBounds.height) - 50);
                    this.projectile.setY(this.tempStat);
                };
                this.tempStat = this.projectile.getX();
                this.self.setX(this.tempStat);
                this.tempStat = this.projectile.getY();
                this.self.setY(this.tempStat);
                this.xCoor = this.self.getX();
                this.yCoor = this.self.getY();
                if ((((this.controls.BUTTON1) && (this.counter >= 35)) || ((this.controls.BUTTON2) && (this.counter >= 35))))
                {
                    this.projectile.setGlobalVariable("attack", true);
                    this.counter = 0;
                };
            }
            else
            {
                this.self.endAttack();
            };
        }

        internal function frame30():*
        {
            gotoAndPlay("loop");
        }


    }
}//package pikachu_fla

