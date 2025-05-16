// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_legeattack_84

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

    public dynamic class link_new_legeattack_84 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var damage:Number;

        public function link_new_legeattack_84()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 10, this.frame11, 11, this.frame12, 21, this.frame22, 22, this.frame23, 26, this.frame27, 30, this.frame31, 35, this.frame36, 48, this.frame49);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.damage = 0;
                this.damage = this.self.getDamage();
                if (this.damage >= 100)
                {
                    gotoAndPlay("heavy");
                };
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame5():*
        {
            this.self.unnattachFromGround();
        }

        internal function frame11():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame12():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }

        internal function frame23():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame27():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":10,
                "damage":10,
                "hitStun":1,
                "selfHitStun":0
            });
        }

        internal function frame31():*
        {
            this.self.setXSpeed(7, false);
            this.self.setIntangibility(true);
        }

        internal function frame36():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(1);
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

