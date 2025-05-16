// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//graveRocks

package 
{
    import flash.display.MovieClip;

    public dynamic class graveRocks extends MovieClip 
    {

        public function graveRocks()
        {
            addFrameScript(13, this.frame14);
        }

        internal function frame14():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

