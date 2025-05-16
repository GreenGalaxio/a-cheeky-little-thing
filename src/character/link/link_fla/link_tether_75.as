// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_tether_75

package link_fla
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

    public dynamic class link_tether_75 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var pLockBox:MovieClip;
        public var self:*;
        public var landing:Boolean;
        public var projectile:*;

        public function link_tether_75()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 8, this.frame9, 9, this.frame10, 19, this.frame20, 20, this.frame21, 24, this.frame25);
        }

        public function landingCheck():void
        {
            this.landing = this.self.isOnGround();
            if (this.landing)
            {
                this.self.toIdle();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.landing = this.self.isOnGround();
                SSF2API.createTimer(this.self, 1, -1, this.landingCheck);
            };
        }

        internal function frame5():*
        {
            this.projectile = null;
            SSF2API.playSound("link_hookshot");
            this.self.setGlobalVariable("tether", true);
            this.self.fireProjectile("tetherDetect");
            this.projectile = this.self.getCurrentProjectile();
        }

        internal function frame9():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "direction":85,
                "hitLag":-1,
                "power":26,
                "kbConstant":100,
                "hitStun":3,
                "selfHitStun":2
            });
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            this.self.setGlobalVariable("tether", false);
            if (this.projectile != null)
            {
                this.projectile.destroy();
            };
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame21():*
        {
            SSF2API.destroyTimer(this.self, this.landingCheck);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

