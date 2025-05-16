// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_rasenganexplosionground_red_201

package naruto_fla
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

    public dynamic class naruto_rasenganexplosionground_red_201 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var character:*;
        public var scale:*;

        public function naruto_rasenganexplosionground_red_201()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 24, this.frame25, 36, this.frame37, 37, this.frame38);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.scale = (0.4 + (this.self.getAttackStat("chargetime") / this.self.getAttackStat("chargetime_max")));
                if (this.scale > 1.5)
                {
                    this.scale = 1.5;
                };
                this.self.setScale(this.scale, this.scale);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.self.destroy);
            };
        }

        internal function frame14():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":22,
                "hitStun":2
            });
        }

        internal function frame25():*
        {
            this.self.refreshAttackID();
            this.character.playVoiceSound(1);
            this.character.playAttackSound(3);
            this.self.updateAttackBoxStats(1, {
                "kbConstant":240,
                "direction":45,
                "damage":10,
                "hitLag":-1
            });
        }

        internal function frame37():*
        {
            stop();
        }

        internal function frame38():*
        {
            gotoAndStop("stopped");
        }


    }
}//package naruto_fla

