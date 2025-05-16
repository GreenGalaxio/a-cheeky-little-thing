// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_upairproj_158

package megaman_fla
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

    public dynamic class megaman_upairproj_158 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var throughCharacter:*;
        public var projectile1:*;
        public var projectile2:*;
        public var projectile3:*;
        public var projectile4:*;
        public var projectile5:*;

        public function megaman_upairproj_158()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            this.projectile1 = null;
            this.projectile2 = null;
            this.projectile3 = null;
            this.projectile4 = null;
            this.projectile5 = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.throughCharacter = this.character;
                this.projectile1 = this.self;
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.self.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.self.destroy);
            };
        }

        internal function frame7():*
        {
            this.character.fireProjectile("megaman_iceslasher2", this.projectile1.getX(), this.projectile1.getY(), true);
            if (this.character.getCurrentProjectile() != null)
            {
                this.projectile2 = this.character.getCurrentProjectile();
            };
            this.character.fireProjectile("megaman_iceslasher2", this.projectile1.getX(), this.projectile1.getY(), true);
            if (this.character.getCurrentProjectile() != null)
            {
                this.projectile3 = this.character.getCurrentProjectile();
            };
            this.character.fireProjectile("megaman_iceslasher2", this.projectile1.getX(), this.projectile1.getY(), true);
            if (this.character.getCurrentProjectile() != null)
            {
                this.projectile4 = this.character.getCurrentProjectile();
            };
            this.character.fireProjectile("megaman_iceslasher2", this.projectile1.getX(), this.projectile1.getY(), true);
            if (this.character.getCurrentProjectile() != null)
            {
                this.projectile5 = this.character.getCurrentProjectile();
            };
            if (((!(this.projectile1 == null)) && (!(SSF2API.getProjectile(this.projectile1) == null))))
            {
                this.projectile1.updateAttackBoxStats(1, {
                    "damage":2,
                    "power":20,
                    "priority":-1,
                    "kbConstant":100
                });
            };
            if (((!(SSF2API.getProjectile(this.projectile2) == null)) && (!(this.projectile2 == null))))
            {
                this.projectile2.setXSpeed(-12);
            };
            if (((!(SSF2API.getProjectile(this.projectile3) == null)) && (!(this.projectile3 == null))))
            {
                this.projectile3.setXSpeed(-6);
            };
            if (((!(SSF2API.getProjectile(this.projectile4) == null)) && (!(this.projectile4 == null))))
            {
                this.projectile4.setXSpeed(6);
            };
            if (((!(SSF2API.getProjectile(this.projectile5) == null)) && (!(this.projectile5 == null))))
            {
                this.projectile5.setXSpeed(12);
            };
        }

        internal function frame22():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package megaman_fla

