// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.Fox_dthrow_81

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

    public dynamic class Fox_dthrow_81 extends MovieClip 
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
        public var chance:*;

        public function Fox_dthrow_81()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 15, this.frame16, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.projectile = null;
            this.chance = 0;
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.fireProjectile("dthrowLaser");
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.projectile = this.self.getCurrentProjectile();
            if (this.projectile != null)
            {
                this.projectile.setXSpeed(-4);
            };
            this.self.playAttackSound(1);
            this.self.attachEffect("fox_blasterEffectDown");
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.fireProjectile("dthrowLaser");
            this.self.playAttackSound(1);
            this.self.attachEffect("fox_blasterEffectDown");
        }

        internal function frame13():*
        {
            this.projectile = this.self.getCurrentProjectile();
            if (this.projectile != null)
            {
                this.projectile.setXSpeed(-4);
            };
            this.self.playAttackSound(1);
            SSF2API.shakeCamera(9);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame19():*
        {
            this.chance = SSF2API.random();
            this.self.playAttackSound(2);
            if ((((this.chance <= 0.05) && (this.self.getCPULevel() >= 8)) && (this.self.isCPU())))
            {
                this.self.importCPUControls([0, 1, 0x0200, 3, 0x0100, 2, 0, 1, 32, 1]);
            };
            if ((((this.chance > 0.05) && (this.chance <= 0.8)) && (this.self.isCPU())))
            {
                this.self.importCPUControls([0, 1, 1088, 1]);
            };
            this.self.endAttack();
        }


    }
}//package fox_fla

