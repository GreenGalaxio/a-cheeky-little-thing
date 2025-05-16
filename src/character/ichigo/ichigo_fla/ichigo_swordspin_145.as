// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_swordspin_145

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_swordspin_145 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function ichigo_swordspin_145()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 8, this.frame9, 11, this.frame12, 14, this.frame15, 17, this.frame18, 20, this.frame21, 23, this.frame24, 26, this.frame27, 29, this.frame30, 32, this.frame33, 35, this.frame36, 46, this.frame47);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame30():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {"hitStun":4});
        }

        internal function frame36():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":2,
                "power":65,
                "direction":90
            });
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

