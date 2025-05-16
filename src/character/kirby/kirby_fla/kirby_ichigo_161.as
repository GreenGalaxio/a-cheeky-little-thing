// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_ichigo_161

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_ichigo_161 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var ichigo_ground:Boolean;

        public function kirby_ichigo_161()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 13, this.frame14, 20, this.frame21, 21, this.frame22, 36, this.frame37);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "charging";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setAttackEnabled(false, "kirby_ichigo");
                this.ichigo_ground = this.self.isOnGround();
                if (!this.ichigo_ground)
                {
                    this.self.updateAttackStats({
                        "xSpeedDecayAir":-0.3,
                        "allowControlGround":false
                    });
                };
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame21():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.setAttackEnabled(false, "kirby_ichigo");
        }

        internal function frame22():*
        {
            this.self.fireProjectile("getsuga2");
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

