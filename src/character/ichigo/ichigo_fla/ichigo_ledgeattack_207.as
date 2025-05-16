// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_ledgeattack_207

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

    public dynamic class ichigo_ledgeattack_207 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var damage:Number;

        public function ichigo_ledgeattack_207()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20, 20, this.frame21, 32, this.frame33, 38, this.frame39, 51, this.frame52);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setIntangibility(true);
                this.damage = 0;
                this.damage = this.self.getDamage();
                if (this.damage >= 100)
                {
                    gotoAndPlay("heavy");
                };
            };
        }

        internal function frame10():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.setIntangibility(false);
            this.self.updateAttackStats({"xSpeedDecay":-1});
            this.self.setXSpeed(8, false);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame21():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame33():*
        {
            this.self.setYSpeed(-4);
            this.self.setXSpeed(2, false);
            this.self.updateAttackBoxStats(1, {"damage":11});
            this.self.setIntangibility(false);
            this.self.updateAttackStats({"xSpeedDecay":-1});
        }

        internal function frame39():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame52():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

