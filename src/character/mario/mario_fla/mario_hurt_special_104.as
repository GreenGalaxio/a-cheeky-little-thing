// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_hurt_special_104

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mario_hurt_special_104 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_hurt_special_104()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "hurt1";
            };
        }

        internal function frame4():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame5():*
        {
            gotoAndStop("done1");
        }


    }
}//package mario_fla

