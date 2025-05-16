// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.BM_dair_death_185

package blackmage_fla
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

    public dynamic class BM_dair_death_185 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var deathProjectile:*;
        public var loopCount:*;
        public var opponent:*;
        public var character:*;

        public function BM_dair_death_185()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 83, this.frame84, 88, this.frame89, 89, this.frame90, 97, this.frame98);
        }

        public function toContinue(_arg_1:*):*
        {
            this.opponent = _arg_1.data.receiver;
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            gotoAndPlay("continue");
        }

        public function latch():void
        {
            parent.y = (this.opponent.getY() - 6);
            parent.x = this.opponent.getX();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.deathProjectile = null;
            this.loopCount = null;
            this.opponent = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.deathProjectile = this.character.getGlobalVariable("deathprojectile");
                if (((!(this.deathProjectile == null)) && (this.deathProjectile.isDead() == true)))
                {
                    this.character.setGlobalVariable("deathIsInTheAir", false);
                    this.deathProjectile.destroy();
                };
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            };
        }

        internal function frame3():*
        {
            this.self.destroy();
        }

        internal function frame4():*
        {
            SSF2API.createTimer(this.self, 1, 86, this.latch);
            if (this.character.getGlobalVariable("deathIsInTheAir"))
            {
                SSF2API.print("Death already attached, removing...");
                this.self.destroy();
            };
            this.character.setGlobalVariable("deathIsInTheAir", true);
            this.character.setGlobalVariable("deathprojectile", this.self);
            SSF2API.playSound("bm_Death_start");
        }

        internal function frame5():*
        {
            this.loopCount++;
        }

        internal function frame84():*
        {
            SSF2API.lightFlash();
        }

        internal function frame89():*
        {
            SSF2API.playSound("bm_Death_finish");
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "damage":6,
                "priority":7,
                "hitStun":-1,
                "selfHitStun":0,
                "camShake":20,
                "direction":270,
                "power":80,
                "kbConstant":60,
                "effectSound":"sw_scratch"
            });
        }

        internal function frame90():*
        {
            this.self.updateProjectileStats({"latch":false});
        }

        internal function frame98():*
        {
            this.character.setGlobalVariable("deathIsInTheAir", false);
            this.self.destroy();
        }


    }
}//package blackmage_fla

