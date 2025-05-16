// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_falling_special_33

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class naruto_falling_special_33 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function naruto_falling_special_33()
        {
            addFrameScript(0, this.frame1, 4, this.frame5);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame5():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package naruto_fla

