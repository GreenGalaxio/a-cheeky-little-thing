// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.dinsfireidle_551

package zelda_fla
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

    public dynamic class dinsfireidle_551 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var charge:int;
        public var blah:*;
        public var maxDamage:*;
        public var camShake:*;
        public var damageVar:*;

        public function dinsfireidle_551()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 18, this.frame19, 19, this.frame20, 25, this.frame26, 46, this.frame47);
        }

        public function destroy(_arg_1:*=null):void
        {
            this.character.getStanceMC().gotoAndPlay("attack");
            gotoAndPlay("continue");
        }

        public function bigger():void
        {
            this.charge++;
            if (this.damageVar <= this.maxDamage)
            {
                this.damageVar = Math.floor((this.self.getAttackBoxStat(0, "damage") + 0.5));
                this.self.updateAttackBoxStats(1, {"damage":this.damageVar});
                this.self.getMC().scaleX = (0.5 + (this.charge / 40));
                this.self.getMC().scaleY = (0.5 + (this.charge / 40));
                this.camShake++;
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.charge = 0;
                this.blah = 0;
                this.maxDamage = 20;
                this.camShake = 0;
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
            };
        }

        internal function frame2():*
        {
            this.damageVar = 0;
            this.blah = SSF2API.playSound("zelda_din_charge");
            SSF2API.createTimer(this.self, 1, -1, this.bigger);
        }

        internal function frame19():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame20():*
        {
            SSF2API.destroyTimer(this.self, this.bigger);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
            this.self.endControl();
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.shakeCamera(4);
            this.self.updateProjectileStats({
                "ghost":true,
                "xdecay":0
            });
        }

        internal function frame26():*
        {
            SSF2API.shakeCamera((4 + (0.5 * this.charge)));
            SSF2API.playSound("zelda_din2");
        }

        internal function frame47():*
        {
            this.self.destroy();
        }


    }
}//package zelda_fla

