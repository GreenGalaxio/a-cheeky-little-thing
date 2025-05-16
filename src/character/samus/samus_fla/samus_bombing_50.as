// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_bombing_50

package samus_fla
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

    public dynamic class samus_bombing_50 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function samus_bombing_50()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 4, this.frame5, 14, this.frame15, 22, this.frame23, 23, this.frame24, 36, this.frame37);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.setXSpeed((this.self.getXSpeed() * 0.3));
                this.self.setYSpeed(-30);
            };
        }

        internal function frame2():*
        {
            this.self.setYSpeed(-5);
        }

        internal function frame3():*
        {
            if (this.self.getXSpeed() > 5)
            {
                this.self.setXSpeed(5);
            }
            else
            {
                if (this.self.getXSpeed() < -5)
                {
                    this.self.setXSpeed(-5);
                };
            };
        }

        internal function frame5():*
        {
            this.self.updateAttackStats({"allowControl":true});
            this.self.fireProjectile("bomb");
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            if (this.self.isOnGround())
            {
                this.self.setYSpeed(-3.5);
            };
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }

        internal function frame24():*
        {
            this.self.updateAttackStats({
                "allowFullInterrupt":true,
                "allowControl":true,
                "allowFastFall":false
            });
            this.self.setYSpeed(-2.1);
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

