// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.bomberman_crouch_51

package bomberman_fla
{
    import flash.display.MovieClip;

    public dynamic class bomberman_crouch_51 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;

        public function bomberman_crouch_51()
        {
            addFrameScript(4, this.frame5);
        }

        internal function frame5():*
        {
            gotoAndPlay("redo");
        }


    }
}//package bomberman_fla

