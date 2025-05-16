// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_mario_169

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class kirby_mario_169 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var mario_ground:Boolean;

        public function kirby_mario_169()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.mario_ground = this.self.isOnGround();
                if (!this.mario_ground)
                {
                    this.self.updateAttackStats({
                        "allowControl":true,
                        "allowControlGround":false,
                        "cancelWhenAirborne":false
                    });
                    SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
                };
            };
        }

        internal function frame7():*
        {
            this.self.fireProjectile("mario_fireball", 22, -20);
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

