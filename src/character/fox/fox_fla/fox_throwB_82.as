// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_throwB_82

package fox_fla
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

    public dynamic class fox_throwB_82 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var projectile:*;
        public var dir:*;

        public function fox_throwB_82()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 12, this.frame13, 15, this.frame16, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.projectile = null;
                this.dir = this.self.isFacingRight();
            };
        }

        internal function frame10():*
        {
            this.self.fireProjectile("bthrowLaser");
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile = this.self.getCurrentProjectile();
            };
            this.projectile.setXSpeed(20, false);
            this.self.playAttackSound(1);
            this.self.attachEffect("fox_blasterEffectBack");
        }

        internal function frame13():*
        {
            this.self.fireProjectile("bthrowLaser");
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile = this.self.getCurrentProjectile();
            };
            this.projectile.setXSpeed(22, false);
            this.projectile.setYSpeed(-7);
            this.self.playAttackSound(1);
            this.self.attachEffect("fox_blasterEffectBack");
        }

        internal function frame16():*
        {
            this.self.fireProjectile("bthrowLaser");
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile = this.self.getCurrentProjectile();
            };
            this.projectile.setXSpeed(21, false);
            this.projectile.setYSpeed(-5);
            this.self.playAttackSound(1);
            this.self.attachEffect("fox_blasterEffectBack");
        }

        internal function frame20():*
        {
            this.self.playAttackSound(2);
            this.self.endAttack();
        }


    }
}//package fox_fla

