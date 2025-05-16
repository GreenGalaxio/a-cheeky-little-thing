// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_dsmash_40

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

    public dynamic class link_new_dsmash_40 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;

        public function link_new_dsmash_40()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 10, this.frame11, 18, this.frame19, 19, this.frame20, 29, this.frame30);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "damage":17,
                "power":20,
                "direction":112
            });
            this.self.updateAttackBoxStats(2, {
                "damage":17,
                "power":20,
                "direction":112
            });
            this.self.updateAttackBoxStats(3, {
                "damage":17,
                "power":20,
                "direction":112
            });
            this.self.refreshAttackID();
        }

        internal function frame20():*
        {
            this.self.updateAttackBoxStats(1, {"damage":16});
            this.self.updateAttackBoxStats(2, {"damage":16});
            this.self.updateAttackBoxStats(3, {"damage":16});
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

