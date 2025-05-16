// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_dowB_special_49

package naruto_fla
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

    public dynamic class naruto_dowB_special_49 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var waiting:*;

        public function naruto_dowB_special_49()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 17, this.frame18, 22, this.frame23, 24, this.frame25, 48, this.frame49);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.waiting = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame2():*
        {
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.updateAttackBoxStats(1, {"direction":90});
            this.self.updateAttackBoxStats(2, {"direction":90});
            this.self.playVoiceSound(1);
        }

        internal function frame25():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":92,
                "power":31,
                "kbConstant":100,
                "damage":15
            });
            this.self.updateAttackBoxStats(2, {
                "direction":92,
                "power":31,
                "kbConstant":100,
                "damage":15
            });
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

